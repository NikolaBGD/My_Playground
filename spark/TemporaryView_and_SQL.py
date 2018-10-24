from pyspark.sql import SparkSession

spark = SparkSession \
        .builder \
        .appName("Python Spark SQL") \
        .config("spark.some.config.option", "some-value") \
        .getOrCreate()


df = spark.read.load("test.csv", format= "csv")

df.createOrReplaceTempView("test1")

sqlDF = spark.sql("SELECT * FROM test1")
sqlDF.show()
