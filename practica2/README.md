# Practica 2 - Coursera Data and Text Analysis

This practice uses a Jupyter Notebook to analyze Coursera course metadata and user comments. The work combines structured data exploration with basic natural language processing.

## Scope

- Loaded and inspected a Coursera course dataset from `Datos.csv`.
- Cleaned and explored course metadata such as title, rating, level, duration, review count, provider, skills, and keywords.
- Processed free-text comments from `Coursera Comments.txt`.
- Applied tokenization, stopword removal, stemming, and lemmatization with NLTK.
- Used part-of-speech tagging and named-entity style extraction for important terms.
- Performed sentiment analysis with NLTK VADER.
- Documented observations directly in the notebook.

## Technology Used

- Python
- Jupyter Notebook
- pandas
- NumPy
- matplotlib
- NLTK
- VADER sentiment analyzer

## Important Files

| Path | Description |
| --- | --- |
| `main.ipynb` | Main notebook with data analysis and NLP workflow. |
| `Datos.csv` | Coursera course metadata dataset. |
| `Coursera Comments.txt` | Raw user comments used for text analysis. |
| Assignment PDF | Original assignment statement for the practice. |

## How to Run

1. Install the required Python packages:

   ```bash
   pip install pandas numpy matplotlib nltk notebook
   ```

2. Start Jupyter Notebook:

   ```bash
   jupyter notebook
   ```

3. Open `main.ipynb` and run the cells in order.

The notebook downloads required NLTK resources such as `punkt`, `stopwords`, `wordnet`, part-of-speech taggers, and the VADER lexicon.

The notebook combines structured course metadata with unstructured review text, covering data cleaning, NLP preprocessing, sentiment scoring, and exploratory analysis.
