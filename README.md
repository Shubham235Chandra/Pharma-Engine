Pharma Engine
Introduction
Pharma Engine is a sophisticated database management system designed to revolutionize the way pharmaceutical information is managed. This project addresses the critical need for a scalable, efficient, and secure method to handle vast amounts of pharmaceutical data, surpassing traditional management tools like Excel spreadsheets.

Features
Comprehensive Data Management: Handles complex details such as drug interactions, chemical compositions, and manufacturer information.
Scalability: Built to efficiently manage growing inventories without compromising performance.
Security: Implements advanced security features to protect sensitive medical data.
User-Friendly Interface: Pharma Engine features a user-friendly interface that simplifies complex database interactions for various user roles, including pharmacists, inventory managers, and medical practitioners.
Data Integrity and Normalization: Ensures high data integrity and applies normalization to organize data efficiently.
Dataset
The project utilizes a dataset from Kaggle, providing detailed information on Indian medicines. The dataset includes product names, manufacturers, prices, salt compositions, medicine descriptions, side effects, and drug interactions.

Dataset Source: Indian Medicine Data on Kaggle
Getting Started
Prerequisites
Python 3.x
Jupyter Notebook
PostgreSQL
Installation
Clone the repository to your local machine:
bash
Copy code
git clone https://github.com/<your-github-username>/Pharma-Engine.git
Install the required Python packages:
Copy code
pip install -r requirements.txt
Usage
Data Preprocessing and Transformation:

Use the medicine.ipynb and new_medicine.ipynb notebooks to preprocess and transform the dataset.
Database Setup:

Import the create.sql and load.sql scripts into PostgreSQL to set up the database schema and load data.
Querying the Database:

Use the provided SQL queries in the Pharma Engine user interface to manage and analyze pharmaceutical data.
Contributing
We welcome contributions from the community. If you wish to contribute to Pharma Engine, please fork the repository and submit a pull request.
