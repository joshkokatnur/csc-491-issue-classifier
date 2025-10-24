import pandas as pd
from sklearn.model_selection import train_test_split

df = pd.read_csv('data/train.csv', index_col = 0)
y = df.pop('issue_label')
X_train,X_val, y_train, y_val = train_test_split(df,y, test_size=1000, random_state=42, stratify=y)
X_train.shape, X_val.shape, y_train.shape, y_val.shape

y_train.value_counts(normalize=True), y_val.value_counts(normalize=True)

train_df = X_train.assign(issue_label=y_train.values)
val_df = X_val.assign(issue_label=y_val.values)

train_df.to_csv('data/train.split.csv')
val_df.to_csv('data/val.split.csv')