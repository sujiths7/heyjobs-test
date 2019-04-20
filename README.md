HeyJobs Campaign and Ad descrepency finder

How to run:
1. Clone the repository
2. Run command `ruby job_ad.rb`

Sample Output:
```
[
  {
    "remote_reference": "1",
    "discrepancies": [
      "status": {
        "remote": "disabled",
        "local": "active"
      },
      "description": {
        "remote": "Rails Engineer",
        "local": "Ruby on Rails Developer"
      }
    ]
  }
]
```
