variable tags {
  type        = map(string)
  description = "List of AWS tags"
}

variable log_bucket_name {
  type = string
  description = "Bucket to store cloudtrail logs"
}