<p align="center">
  <img src="assets/profile-banner.png" alt="Good questions. Clearer connections. Research, analytics and visual storytelling." width="100%">
</p>

# Margarita Bermejo Cano

**People science · Research · R-first data storytelling**

I’m interested in making complex questions easier to understand through research,
analysis, and clear visual communication. This is a curated home for my analytical
projects and career portfolio.

**[Featured study](#featured-study)** ·
**[Explore the projects](#selected-projects)** ·
**[Find the R code](#find-your-way)** ·
**[Visit my career portfolio ↗](https://mberca.github.io/cv-margarita/)**

## Featured study

### Titanic / Patterns, Prediction & Uncertainty

**Real public data · R & Python · Association rules · Random forest · Bayesian analysis**

<a href="https://mberca.github.io/titanic-patterns/">
  <img src="https://raw.githubusercontent.com/mberca/titanic-patterns/main/outputs/story-preview.png" alt="Titanic real-data story: three analytical questions and Bayesian group-rate intervals." width="100%">
</a>

The same historical data, three different questions: what appears together,
what predicts an outcome, and how certain are we? This study pairs visual
storytelling with grouped validation, training-only preprocessing, and a shared
held-out comparison across languages.

**[Explore the story ↗](https://mberca.github.io/titanic-patterns/)** ·
[R edition](https://github.com/mberca/titanic-patterns/tree/main/R) ·
[Python edition](https://github.com/mberca/titanic-patterns/tree/main/Python) ·
[Methodology](https://github.com/mberca/titanic-patterns/blob/main/METHODOLOGY.md)

## Selected projects

Two ways to explore association rules: an intuitive retail example and a
learning-analytics example where the population denominator changes the story.
Both use **fully synthetic data**, with runnable **R and Python** editions.

<table>
  <tr>
    <td width="50%" valign="top">
      <a href="https://mberca.github.io/basket-atlas/">
        <img src="https://raw.githubusercontent.com/mberca/basket-atlas/main/outputs/preview.png" alt="Basket Atlas preview: bookstore association network and a rule compared with its baseline." width="100%">
      </a>
      <h3>01 / Basket Atlas</h3>
      <p>Which items travel together in an imaginary bookstore? Explore a directed network, a support–confidence scatterplot, and the difference between popularity and lift.</p>
      <p><strong>Methods:</strong> Apriori · market-basket analysis · visual explanation</p>
      <p>
        <a href="https://mberca.github.io/basket-atlas/"><strong>Explore demo ↗</strong></a>
        &nbsp;·&nbsp;
        <a href="https://github.com/mberca/basket-atlas/tree/main/R">R edition</a>
        &nbsp;·&nbsp;
        <a href="https://github.com/mberca/basket-atlas">Repository</a>
      </p>
    </td>
    <td width="50%" valign="top">
      <a href="https://mberca.github.io/learning-constellations/">
        <img src="https://raw.githubusercontent.com/mberca/learning-constellations/main/outputs/hero.png" alt="Learning Constellations preview: skill network and directed association-rule matrix." width="100%">
      </a>
      <h3>02 / Learning Constellations</h3>
      <p>Which learning topics appear together, and how does that change within a track? Inspect a skill constellation, a directed rule matrix, and population-specific baselines.</p>
      <p><strong>Methods:</strong> Apriori · stratified analysis · denominator awareness</p>
      <p>
        <a href="https://mberca.github.io/learning-constellations/"><strong>Explore demo ↗</strong></a>
        &nbsp;·&nbsp;
        <a href="https://github.com/mberca/learning-constellations/tree/main/R">R edition</a>
        &nbsp;·&nbsp;
        <a href="https://github.com/mberca/learning-constellations">Repository</a>
      </p>
    </td>
  </tr>
</table>

## Find your way

| You want to… | Basket Atlas | Learning Constellations |
|---|---|---|
| **Try the visualization** without installing anything | [Live demo](https://mberca.github.io/basket-atlas/) | [Live demo](https://mberca.github.io/learning-constellations/) |
| **Start in R / RStudio** | [R getting-started guide](https://github.com/mberca/basket-atlas/blob/main/R/README.md) | [R getting-started guide](https://github.com/mberca/learning-constellations/blob/main/R/README.md) |
| **Read the R analysis** | [Apriori + charts](https://github.com/mberca/basket-atlas/blob/main/R/analysis.R) | [Track-aware Apriori + charts](https://github.com/mberca/learning-constellations/blob/main/R/analysis.R) |
| **Run an interactive R app locally** | [Shiny app](https://github.com/mberca/basket-atlas/blob/main/R/app.R) | [Shiny app](https://github.com/mberca/learning-constellations/blob/main/R/app.R) |
| **Read the executed Python notebook** | [Bookstore study](https://github.com/mberca/basket-atlas/blob/main/notebooks/01_bookstore_study.ipynb) | [Learning exploration](https://github.com/mberca/learning-constellations/blob/main/notebooks/01_exploration.ipynb) |
| **Inspect the R-generated results** | [Rule tables + figure](https://github.com/mberca/basket-atlas/tree/main/outputs/r) | [Population tables + figure](https://github.com/mberca/learning-constellations/tree/main/outputs/r) |
| **Understand the assumptions and limits** | [Project guide](https://github.com/mberca/basket-atlas#reading-the-metrics) | [Project guide](https://github.com/mberca/learning-constellations#what-the-metrics-mean) |

The browser demos are static, self-contained experiences. The Shiny apps run
locally; GitHub Pages does not host an R server.

## Career & research

For my background and selected professional work, start with my
**[career portfolio ↗](https://mberca.github.io/cv-margarita/)**.
Its [source repository](https://github.com/mberca/cv-margarita) is separate from
the synthetic analytical showcases above.

## How I present analytical work

**A clear question → transparent methods → an explorable result → honest limits.**

R is my preferred analytical language. These projects also provide Python
implementations so readers can compare approaches. Basket Atlas and Learning Constellations use invented data—not anonymized
customer, employee, or learner records. Titanic uses documented public historical
data. Association rules and model coefficients are descriptive, not evidence
of causality.
