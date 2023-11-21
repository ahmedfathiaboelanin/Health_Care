import pandas as pd
from sklearn.preprocessing import OneHotEncoder
from sklearn.ensemble import RandomForestClassifier
import joblib

# Load your original data
original_data = pd.read_csv("original_data.csv")

# Extract symptoms from the second row to the end and from the second column to the end
symptoms_data = original_data.iloc[1:, 1:]

# Assuming the target variable is in the first column, adjust accordingly if it's in a different location
target = original_data.iloc[1:, 0]

# Check if there is data to train the model
if not symptoms_data.empty and not target.empty:
    # Create a one-hot encoder for the symptoms
    encoder = OneHotEncoder(categories='auto', sparse=False, handle_unknown='ignore')
    symptoms_encoded = encoder.fit_transform(symptoms_data)

    # Check if there is data to fit the model
    if symptoms_encoded.shape[0] > 0:
        # Create and fit the model
        model = RandomForestClassifier()
        model.fit(symptoms_encoded, target)

        # Save the model
        joblib.dump(model, 'model.pkl')

        # Assuming 'new_data' is a list of lists representing symptoms
        new_data = [
            ['itching', 'skin_rash', 'nodal_skin_eruptions', 'dischromic_patches', 'Symptom_5', 'Symptom_6', 'Symptom_7', 'Symptom_8', 'Symptom_9', 'Symptom_10', 'Symptom_11', 'Symptom_12', 'Symptom_13', 'Symptom_14', 'Symptom_15', 'Symptom_16', 'Symptom_17'],
            # Add more lists representing symptoms for other cases
        ]

        # Ensure the one-hot encoding has the same columns as feature_names
        new_data_df = pd.DataFrame(new_data, columns=symptoms_data.columns)

        # Ensure there is data to make predictions
        if not new_data_df.empty:
            new_data_encoded = encoder.transform(new_data_df)

            # Check if there is data to make predictions
            if new_data_encoded.shape[0] > 0:
                # Make predictions
                predictions = model.predict(new_data_encoded)
                print(predictions)
            else:
                print("No data for making predictions.")
        else:
            print("No data for making predictions.")
    else:
        print("No data for training the model.")
else:
    print("No data for training the model.")
