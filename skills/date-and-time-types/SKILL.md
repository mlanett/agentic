---
name: date-and-time-types
description: Preferred data types for storing dates and times.
---

# Representation for Dates, Times, and DateTimes

Timestamp should generally be stored in UTC unless there is a good reason to store them as local times.

Types and/or Format:

- JSON: ISO 8601
- Kotlin: kotlinx.datetime.Instant
- Protobuf: google.protobuf.Timestamp
- Python: datetime.datetime
- SQL: TIMESTAMP_LTZ (must be sure to use session timezone of UTC)

Types and/or Format, Local Times:

- Kotlin: kotlinx.datetime.LocalDateTime
- SQL: TIMESTAMP_NTZ
