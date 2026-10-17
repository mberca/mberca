"""Check the public profile's navigation, editorial structure and boundaries."""

from pathlib import Path
import re
import unittest


ROOT = Path(__file__).resolve().parents[1]


class ProfileTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.readme = (ROOT / "README.md").read_text(encoding="utf-8")

    def test_navigation_targets_exist(self):
        headings = re.findall(r"^#{1,6} (.+)$", self.readme, re.MULTILINE)
        anchors = {
            re.sub(r"[^\w\- ]", "", heading.lower()).replace(" ", "-")
            for heading in headings
        }
        for target in re.findall(r"\]\(#([^)]+)\)", self.readme):
            with self.subTest(target=target):
                self.assertIn(target, anchors)

    def test_featured_and_rotating_projects_stay_distinct(self):
        featured = self.readme.split("## Featured study\n", 1)[1]
        featured, rotating = featured.split("## Worth a Look\n", 1)
        self.assertIn("### Titanic /", featured)
        self.assertNotIn("### October", featured)
        self.assertIn("### October 2026 · Wonderland, Measured", rotating)
        self.assertIn("METHODOLOGY.md", rotating)

    def test_all_three_publications_have_individual_links(self):
        research = self.readme.split("## Selected research\n", 1)[1]
        research = research.split("\n## Featured study", 1)[0]
        links = re.findall(r"\]\((https://[^)]+)\)", research)
        self.assertEqual(len(links), 3)
        self.assertEqual(len(set(links)), 3)
        self.assertIn(
            "https://adoption.microsoft.com/files/viva/"
            "The-state-of-AI-change-readiness-eBook.pdf",
            links,
        )
        self.assertEqual(research.count("Co-author"), 3)

    def test_private_destinations_are_not_promoted(self):
        for project in ("basket-atlas", "learning-constellations", "cv-margarita"):
            with self.subTest(project=project):
                self.assertNotIn(project, self.readme)
        self.assertNotIn("mailto:", self.readme)
        self.assertNotRegex(self.readme, r"[A-Z]:\\")

    def test_local_images_exist_and_have_alt_text(self):
        images = re.findall(r'<img src="([^"]+)" alt="([^"]+)"', self.readme)
        self.assertTrue(images)
        for source, alt in images:
            with self.subTest(source=source):
                self.assertTrue(alt.strip())
                if not source.startswith("https://"):
                    self.assertTrue((ROOT / source).is_file())

    def test_learning_projects_are_not_presented_as_business_impact(self):
        self.assertIn("AI-assisted learning and showcase projects", self.readme)
        self.assertIn("not claims of business", self.readme)
        self.assertIn("not causes", self.readme)
        self.assertIn("not measures of literary importance", self.readme)


if __name__ == "__main__":
    unittest.main()
