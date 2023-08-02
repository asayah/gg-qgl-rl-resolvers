# gg-qgl-rl-resolvers

Run `run.sh < GG Licence>`
Wait until everything start and istio is installed

Run `test.sh` 

make this query

```
query MyQuery {
  getBlogs {
    id
    content
  }
}
```


result expected 
```
{
    "data": {
        "getBlogs": null
    },
    "errors": [
        {
            "message": "rest resolver got response status 429 from the upstream, body: 'local_rate_limited',",
            "locations": [
                {
                    "line": 2,
                    "column": 3
                }
            ]
        }
    ]
}
```
