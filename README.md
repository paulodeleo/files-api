# Files API

## Development instructions

To run the application using docker-compose just execute:

`docker-compose up -d`

`docker-compose run --rm web rake db:setup`

To stop the applicaton execute:

`docker-compose stop`


## Sample GET URI to /files on localhost

http://localhost:3000/files/+Tag2%20+Tag3%20-Tag4/1

The response (based on sample data) should be something like:

```
{
  "total_records": 2,
  "related_tags": [
    {
      "tag": "Tag1",
      "file_count": 1
    },
    {
      "tag": "Tag5",
      "file_count": 2
    }
  ],
  "records": [
    {
      "uuid": "48182a81-3705-4565-b6bb-000c8bdbfb73",
      "name": "File 1"
    },
    {
      "uuid": "a702bafc-c492-41cb-88c9-d1b8001e0bc5",
      "name": "File 3"
    }
  ]
}
```


## Sample POST to /file using curl:

```
curl -X POST \
  http://localhost:3000/file \
  -H 'Content-Type: application/json' \
  -d '{"name": "File 99", "tags": ["Tag98", "Tag99"]}''
```

The response should be something like:

```
{
    "uuid": "b0eec375-246f-415a-ac13-3075dedf1325"
}
```