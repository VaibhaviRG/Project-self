
# Movie Recommender System using Streamlit
This project is a content-based movie recommender system utilizing the TMDB (The Movie Database) dataset. The recommender system uses cosine similarity to suggest movies based on their content, which includes genres, keywords, cast, and crew information.

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

2.Interact with the Application: Access the application through the provided local URL in your web browser. Select a movie title from the dropdown menu and click the "Recommend" button to view similar movie recommendations along with their posters.

## References
- TMDB API: https://www.kaggle.com/datasets/tmdb/tmdb-movie-metadata

## Conclusion
This content-based recommender system provides a straightforward yet effective way to suggest movies based on their content similarity. It leverages various features from the TMDB dataset and uses text vectorization and cosine similarity to find and recommend similar movies.

### Note: 
Ensure that you have obtained necessary API keys for accessing the TMDB API and replace '5e54d32cea9babe067426415800b253e' with your own API key in the code.
