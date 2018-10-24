from pyspark.sql import SparkSession

spark = SparkSession \
    .builder \
    .appName("Python Spark SQL basic example.") \
    .config("spark.some.config.option", "some-value") \
    .getOrCreate()

df = spark.read.load("./test.csv", format = "csv")
print ("df.show():\n------------------------")
df.show()

print ("\n------------------------\ndf.select(\"_c0\",\"_c1\").show():\n------------------------")
df.select("_c0","_c1").show()
