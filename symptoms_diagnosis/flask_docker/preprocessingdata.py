from sklearn.ensemble import RandomForestClassifier
from sklearn.feature_selection import SelectFromModel
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split, cross_val_score
import numpy as np 
from sklearn.utils import shuffle
from sklearn.datasets import make_classification


# Generate a synthetic dataset
X, y = make_classification(n_samples=1000, n_features=20, random_state=42)
# Create a random forest classifier
model = RandomForestClassifier(n_estimators=100, random_state=42)
# Split the data into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)


# Fit the model on your training data
model.fit(X_train, y_train)

# Assess feature importance
feature_importance = model.feature_importances_


# Introduce data leakage by duplicating some features
X_leakage = np.hstack([X, X[:, :5]])  # Duplicating the first 5 features
X_leakage, y_leakage = shuffle(X_leakage, y, random_state=42)

# Select features based on importance
sfm = SelectFromModel(model, threshold=0.05)  # You can adjust the threshold
sfm.fit(X_train, y_train)
X_train_selected = sfm.transform(X_train)
X_test_selected = sfm.transform(X_test)

# Retrain the model on the selected features
model.fit(X_train_selected, y_train)

# Make predictions on the test set
y_pred_test = model.predict(X_test_selected)

# Evaluate accuracy on the test set
test_accuracy = accuracy_score(y_test, y_pred_test)
print(f'Test Accuracy: {test_accuracy}')
