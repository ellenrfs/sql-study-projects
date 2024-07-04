# %%
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt

# %%
df_books = pd.read_csv("csv/Books.csv").drop_duplicates()
df_ratings = pd.read_csv("csv/Ratings.csv").drop_duplicates()
df_users = pd.read_csv("csv/Users.csv").drop_duplicates().dropna(subset=['Age'])

# %%
df_users

# %%
books_by_author = (
    df_books[["Book-Author", "ISBN"]]
    .groupby("Book-Author", as_index=False)
    .count()
    .sort_values(by="ISBN", ascending=False)
    .head(20)
)


books_by_author = books_by_author[books_by_author["Book-Author"]!= "Not Applicable (Na )"]

# %%
x_axis = books_by_author["Book-Author"]
y_axis = books_by_author["ISBN"]
plt.title("Quantidade de livros por autor (gráfico de barras)", loc="center")
plt.ylabel("Quantidade")
plt.xlabel("Autor")
plt.xticks(rotation=90)
plt.bar(x_axis, y_axis, color="orange")
plt.show()

# %%
books_by_publisher = (
    df_books[["Publisher", "ISBN"]]
    .groupby("Publisher", as_index=False)
    .count()
    .sort_values(by="ISBN", ascending=False)
    .head(20)
)

books_by_publisher

# %%
x_axis = books_by_publisher["Publisher"]
y_axis = books_by_publisher["ISBN"]
plt.title("Quantidade de livros por editora (gráfico de barras)", loc="center")
plt.ylabel("Quantidade")
plt.xlabel("Editora")
plt.xticks(rotation=90)
plt.bar(x_axis, y_axis, color="teal")
plt.show()

# %%
df_ratings_join = df_ratings.merge(df_books, on="ISBN", how="inner")
df_ratings_join

# %%
df_counted = df_ratings_join[["Publisher", "Book-Rating"]].groupby(
    "Publisher", as_index=False
).count().sort_values(by="Book-Rating", ascending=False)

df_counted_filtered = df_counted[df_counted["Book-Rating"]>=100]

df_counted_filtered


# %%


# %%
df_ratings_mean = (
    df_ratings_join[["Publisher", "Book-Rating"]]
    .groupby("Publisher", as_index=False)
    .mean("Book-Rating")
    .sort_values(by="Book-Rating", ascending=False)
    .merge(df_counted_filtered["Publisher"], on="Publisher", how="inner")
    .head(20)
)

# %%
x_axis = df_ratings_mean["Publisher"]
y_axis = df_ratings_mean["Book-Rating"]
plt.title("Média das notas dos livros por editora (gráfico de barras)", loc="center")
plt.ylabel("Nota Média")
plt.xlabel("Editora")
plt.xticks(rotation=90)
ax = plt.gca()
ax.set_ylim([0, 10])
plt.bar(x_axis, y_axis, color="indigo")
plt.show()

# %%
df_counted = df_ratings_join[["Book-Title", "Book-Rating"]].groupby(
    "Book-Title", as_index=False
).count().sort_values(by="Book-Rating", ascending=False)

df_counted_filtered = df_counted[df_counted["Book-Rating"]>=100]

df_ratings_mean_books = (
    df_ratings_join[["Book-Title", "Book-Rating"]]
    .groupby("Book-Title", as_index=False)
    .mean("Book-Rating")
    .sort_values(by="Book-Rating", ascending=False)
    .merge(df_counted_filtered["Book-Title"], on="Book-Title", how="inner")
    .head(20)
)
df_ratings_mean_books

# %%
x_axis = df_ratings_mean_books["Book-Title"]
y_axis = df_ratings_mean_books["Book-Rating"]
plt.title("Média das notas dos livros por Título (gráfico de barras)", loc="center")
plt.ylabel("Nota Média")
plt.xlabel("Título")
plt.xticks(rotation=90)
ax = plt.gca()
ax.set_ylim([0, 10])
plt.bar(x_axis, y_axis, color="lightcoral")
plt.show()


