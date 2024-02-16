import streamlit as st
import pickle
import pandas as pd
import requests


def fetch_poster(movie_id):
    response = requests.get(
        "https://api.themoviedb.org/3/movie/{}?api_key=5e54d32cea9babe067426415800b253e".format(movie_id))
    data = response.json()
    return "https://image.tmdb.org/t/p/w500/" + data[
        'poster_path']  # complete path + image->complete poster path


def recommend(movie):
    movie_index = movies[movies['title'] == movie].index[0]
    distances = similarity[movie_index]
    movies_list = sorted(list(enumerate(distances)), reverse=True, key=lambda x: x[-1])[1:6]

    recommended_movies = []
    recommended_movies_posters = []
    for i in movies_list:
        movie_id = movies.iloc[i[0]].movie_id

        recommended_movies.append(movies.iloc[i[0]].title)
        # fetch poster from API
        recommended_movies_posters.append(fetch_poster(movie_id))
    return recommended_movies, recommended_movies_posters


# copy the file from os\Users\vaibh\Projects-my and then paste in the left
movies_dict = pickle.load(
    open(r'C:\Users\vaibh\PycharmProjects\Project-self\Recommender_System_Movie\movie_dict.pkl',
         'rb'))  # right click the data->copy path/reference->actual path
movies = pd.DataFrame(movies_dict)

similarity = pickle.load(
    open(r'C:\Users\vaibh\PycharmProjects\Project-self\Recommender_System_Movie\similarity.pkl', 'rb'))

st.title('Movie Recommender System')

selected_movie_name = st.selectbox('How would you like to be contacted?', movies['title'].values)

if st.button('Recommend'):
    names, posters = recommend(selected_movie_name)
    col1, col2, col3, col4, col5 = st.columns(5)

    with col1:
        st.text(names[0])
        st.image(posters[0])
    with col2:
        st.text(names[1])
        st.image(posters[1])
    with col3:
        st.text(names[2])
        st.image(posters[2])
    with col4:
        st.text(names[3])
        st.image(posters[3])
    with col5:
        st.text(names[4])
        st.image(posters[4])
