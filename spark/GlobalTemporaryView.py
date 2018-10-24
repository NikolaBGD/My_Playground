import common_module


spark = common_module.createSparkSession()

"""
spark =  SparkSession \
        .builder \
        .appName("Python Spark SQL basic example") \
        .config("spark.some.config.option", "some-value") \
        .getOrCreate()
"""


df = spark.read.load("test.csv", format = "csv")
#df.show()


#df.createOrReplaceTempView("test2")
df.createGlobalTempView("test2")
spark.sql("SELECT * FROM global_temp.test2").show()
spark.newSession().sql("SELECT * FROM global_temp.test2").show()
