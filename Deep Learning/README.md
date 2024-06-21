# MNIST Handwritten Digit Classification with Deep Neural Network
## Overview
This repository contains a simple deep neural network built with TensorFlow and Keras for classifying handwritten digits from the MNIST dataset. The project involves building, training, and evaluating a neural network model to achieve high accuracy in digit classification.

## Dataset
The MNIST dataset consists of 70,000 grayscale images of handwritten digits (0-9), each of size 28x28 pixels. It is a standard dataset in the field of machine learning and computer vision.

## Project Overview:
  - Goal: Train a model to accurately identify handwritten digits from 0 to 9.
  - Dataset: MNIST dataset, containing 60,000 training examples and 10,000 test examples.
  - Model Architecture: A fully connected neural network with multiple layers, ReLU activation, and dropout for regularization.
  - Training: The model was trained using the Adam optimizer and Sparse Categorical Crossentropy loss.

## Key Features:
  - Data Preprocessing: Images are normalized to scale pixel values between 0 and 1.
  - Model Summary: The model architecture is presented with a clear summary of its layers and parameters.
  - Training Visualization: Plots of training and validation loss and accuracy are included to analyze model performance.
  - Predictions Visualization: Example predictions are displayed with their true labels for visual assessment.
  - Metrics: Accuracy on both the training and testing sets is reported.

## Results
  - Training Accuracy: 99.42%
  - Test Accuracy: 98.21%
  - The model showed excellent performance on both the training and test sets, with minimal errors.
