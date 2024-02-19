
# Movie Recommender System using Streamlit
This project implements a movie recommender system using Streamlit, a Python library for building web applications. The recommender system suggests similar movies based on user-selected preferences using a content-based approach.

## Overview
The Movie Recommender System utilizes the TMDB (The Movie Database) API to fetch movie posters and information. It recommends movies similar to the user-selected movie title using cosine similarity scores calculated from movie features.

## Requirements
Ensure you have the following dependencies installed:
- Python (version 3.6 and above)
- Streamlit
- Pandas
- Requests

## Data Files
- **movie_dict.pkl**: A pickled dictionary containing movie information.
- **similarity.pkl**: A pickled file containing similarity scores between movies.
Make sure to have these files accessible in the specified paths mentioned in the code.

## Usage
1.Run the Application: Execute the Streamlit application by running the following command in the terminal:
streamlit run app.py

2.Interact with the Application: Access the application through the provided local URL (usually http://localhost:8501) in your web browser. Select a movie title from the dropdown menu and click the "Recommend" button to view similar movie recommendations along with their posters.

## References
- TMDB API: https://www.kaggle.com/datasets/tmdb/tmdb-movie-metadata
