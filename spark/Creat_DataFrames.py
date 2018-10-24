from pyspark.sql import SparkSession

spark = SparkSession \
    .builder \
    .appName("Python Spark SQL basic example.") \
    .config("spark.some.config.option", "some-value") \
    .getOrCreate()

df = spark.read.load("./test.csv", format = "csv")
print ("df.show():============================")
df.show()


print ("============================df.printSchema():============================")
df.printSchema()

print ("============================df.select(\"_c0\",\"_c1\").show():============================")
df.select("_c0","_c1").show()

print ("\n============================\ndf.select(df['_c0'], df['_c2'] + 1).show():============================")
df.select(df['_c0'], df['_c2'] + 1).show()

print ("\n============================\ndf.select(df._c0).show():\n============================")
df.select(df._c0).show()

print ("\n============================\ndf.filter(df['_c2'] > 22).show():\n============================")
df.filter(df['_c2'] > 22).show()

print ("\n============================\ndf.groupBy(\"_c2\").count().show():\n============================")
df.groupBy("_c2").count().show()

