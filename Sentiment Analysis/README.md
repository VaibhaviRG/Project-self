# Sentiment Analysis of Cancer Survivors and Caregivers' Posts
## Project Description
This project focuses on performing sentiment analysis on a dataset comprising 10,392 posts from cancer patients and their caregivers, sourced from platforms like Reddit, Daily Strength, and the Health Board. The posts pertain to five types of cancer: brain, colon, liver, leukemia, and lung cancer. Each post was scored based on the emotions expressed, using a scale from -2 to 1. Negative scores (-1 or -2) indicate grief or suffering, positive scores (1) reflect happy emotions such as relief or accomplishment, and a score of 0 denotes neutrality.

## Objective
The primary goal is to understand the emotional aspects of cancer patients' and caregivers' posts for a mental health study, leveraging machine learning models to classify the sentiment of these posts accurately.

## Methodology
 1. **Data Preprocessing**:
    - Cleaned text data by removing unnecessary symbols, digits, and stopwords.
    - Applied word lemmatization using the NLTK package.
2. **Feature Engineering**:
    - Converted text data into vectors using TF-IDF (Term Frequency-Inverse Document Frequency).
3. **Model Development**:
    - Built and evaluated multiple models, including XGBoost and Random Forest.
    - Achieved a maximum accuracy of 72% with the XGBoost model on test data.
      
## Tools and Technologies Used
 - Programming Language: Python
 - Libraries: NLTK, Scikit-learn, XGBoost
 - Techniques: Text Preprocessing, Lemmatization, TF-IDF, Machine Learning Model Training and Evaluation

## Results
The XGBoost model demonstrated the highest accuracy of 72% on the test dataset, making it the best-performing model for this sentiment analysis task.

## Conclusion
This project highlights the effective use of machine learning techniques in understanding and classifying the emotional content of posts by cancer patients and caregivers, providing valuable insights for mental health studies.
