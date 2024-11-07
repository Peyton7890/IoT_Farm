# Timestream Database Name
variable "timestream_database_name" {
  description = "The name of the Timestream database for storing IoT farm data"
  type        = string
  default     = "iot_farm_database"
}

# Timestream Table Name
variable "timestream_table_name" {
  description = "The name of the Timestream table for storing sensor data"
  type        = string
  default     = "sensor_data"
}

# Memory Store Retention Period (in hours)
variable "memory_store_retention_hours" {
  description = "Retention period in hours for the memory store"
  type        = number
  default     = 24  # Keep data in memory store for 24 hours
}

# Magnetic Store Retention Period (in days)
variable "magnetic_store_retention_days" {
  description = "Retention period in days for the magnetic store"
  type        = number
  default     = 365  # Keep data in magnetic store for 1 year
}
