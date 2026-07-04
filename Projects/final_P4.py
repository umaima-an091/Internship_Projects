import pandas as pd
import matplotlib.pyplot as plt

# Load Dataset
df = pd.read_excel("Cleaned_Dataset.xlsx")

# Convert Date column
df["Date"] = pd.to_datetime(df["Date"])

# 1. BAR CHART
# Top 10 Products by Sales
product_sales = (
    df.groupby("Product")["TotalPrice"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
)

plt.figure(figsize=(10,6))
product_sales.plot(kind="bar")
plt.title("Top 10 Products by Total Sales")
plt.xlabel("Product")
plt.ylabel("Sales")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# 2. LINE CHART
# Monthly Sales Trend
monthly_sales = (
    df.groupby(df["Date"].dt.to_period("M"))["TotalPrice"]
      .sum()
)

monthly_sales.index = monthly_sales.index.astype(str)

plt.figure(figsize=(10,6))
plt.plot(monthly_sales.index, monthly_sales.values, marker="o")
plt.title("Monthly Sales Trend")
plt.xlabel("Month")
plt.ylabel("Sales")
plt.xticks(rotation=45)
plt.grid(True)
plt.tight_layout()
plt.show()

# 3. SCATTER PLOT
# Quantity vs Total Price
plt.figure(figsize=(8,6))
plt.scatter(df["Quantity"], df["TotalPrice"])
plt.title("Quantity vs Total Price")
plt.xlabel("Quantity")
plt.ylabel("Total Price")
plt.grid(True)
plt.tight_layout()
plt.show()

# 4. STACKED BAR CHART
# Product vs Order Status
status = pd.crosstab(df["Product"], df["OrderStatus"])

status = status.loc[
    df.groupby("Product")["TotalPrice"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
      .index
]

status.plot(kind="bar", stacked=True, figsize=(10,6))
plt.title("Order Status by Product")
plt.xlabel("Product")
plt.ylabel("Number of Orders")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

print("Data visualization completed successfully.")