# *Movies API:* Methods

Endpoint to return the movies, ordered by creation:

```ruby
  # get /v1/movies
  # Parameters:
  "user_id": 1
```
Will return:

```ruby
  {
    "data": [
        {
            "id": "2",
            "type": "catalogue",
            "attributes": {
                "id": 2,
                "category": "movie",
                "title": "Beneath the Bleeding",
                "plot": "Am I dying, or is this my birthday?"
            },
            "relationships": {
                "options": {
                    "data": [
                        {
                            "id": "4",
                            "type": "option"
                        },
                        {
                            "id": "5",
                            "type": "option"
                        },
                        {
                            "id": "6",
                            "type": "option"
                        }
                    ]
                }
            }
        } ...
    ],
    "included": [
        {
            "id": "4",
            "type": "option",
            "attributes": {
                "name": "assumenda",
                "description": "Consequuntur fugit sit deserunt.",
                "expiration": 3,
                "price": "35.04"
            }
        },
        {
            "id": "5",
            "type": "option",
            "attributes": {
                "name": "ea",
                "description": "Impedit voluptatibus ad iusto.",
                "expiration": 1,
                "price": "96.05"
            }
        },
        {
            "id": "6",
            "type": "option",
            "attributes": {
                "name": "accusamus",
                "description": "Tenetur beatae explicabo est.",
                "expiration": 8,
                "price": "16.08"
            }
        } ...
    ]
  }
```

An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number:

```ruby
  # get /v1/seasons
  # Parameters:
  "user_id": 1
```
Will return:

```ruby
  {
    "data": [
        {
            "id": "1",
            "type": "catalogue",
            "attributes": {
                "id": 1,
                "category": "season",
                "title": "Specimen Days",
                "plot": "I want your bunk!"
            },
            "relationships": {
                "episodes": {
                    "data": [
                        {
                            "id": "15",
                            "type": "episode"
                        },
                        {
                            "id": "16",
                            "type": "episode"
                        } ...
                    ]
                },
                "options": {
                    "data": [
                        {
                            "id": "1",
                            "type": "option"
                        },
                        {
                            "id": "2",
                            "type": "option"
                        } ...
                    ]
                }
            }
        } ...
    ],
    "included": [
        {
            "id": "15",
            "type": "episode",
            "attributes": {
                "number": 13,
                "name": "Gliding Over All"
            }
        },
        {
            "id": "16",
            "type": "episode",
            "attributes": {
                "number": 14,
                "name": "Phoenix"
            }
        } ... ,
        {
            "id": "1",
            "type": "option",
            "attributes": {
                "name": "dolorum",
                "description": "Optio quam occaecati fugiat.",
                "expiration": 3,
                "price": "39.01"
            }
        },
        {
            "id": "2",
            "type": "option",
            "attributes": {
                "name": "in",
                "description": "Sit dolorem dolores deserunt.",
                "expiration": 6,
                "price": "95.05"
            }
        } ...
    ]
  }
```

An endpoint to return both movies and seasons, ordered by creation:

```ruby
  # GET /v1/catalogues
  # Parameters:
  "user_id": 1
  ```

Will return:

```ruby
  {
    "data": [
        {
            "id": "1",
            "type": "catalogue",
            "attributes": {
                "id": 1,
                "category": "season",
                "title": "Specimen Days",
                "plot": "I want your bunk!"
            },
            "relationships": {
                "episodes": {
                    "data": [
                        {
                            "id": "15",
                            "type": "episode"
                        },
                        {
                            "id": "16",
                            "type": "episode"
                        } ...
                    ]
                },
                "options": {
                    "data": [
                        {
                            "id": "1",
                            "type": "option"
                        },
                        {
                            "id": "2",
                            "type": "option"
                        } ...
                    ]
                }
            }
        },
        {
            "id": "2",
            "type": "catalogue",
            "attributes": {
                "id": 2,
                "category": "movie",
                "title": "Beneath the Bleeding",
                "plot": "Am I dying, or is this my birthday?"
            },
            "relationships": {
                "options": {
                    "data": [
                        {
                            "id": "4",
                            "type": "option"
                        },
                        {
                            "id": "5",
                            "type": "option"
                        } ...
                    ]
                }
            }
        } ...
    ],
    "included": [
        {
            "id": "15",
            "type": "episode",
            "attributes": {
                "number": 13,
                "name": "Gliding Over All"
            }
        },
        {
            "id": "16",
            "type": "episode",
            "attributes": {
                "number": 14,
                "name": "Phoenix"
            }
        } ... ,
        {
            "id": "1",
            "type": "option",
            "attributes": {
                "name": "dolorum",
                "description": "Optio quam occaecati fugiat.",
                "expiration": 3,
                "price": "39.01"
            }
        },
        {
            "id": "2",
            "type": "option",
            "attributes": {
                "name": "in",
                "description": "Sit dolorem dolores deserunt.",
                "expiration": 6,
                "price": "95.05"
            }
        } ...
    ]
  }
```

An endpoint for a user to perform a purchase of a content:

```ruby
  # POST /v1/purchase

  # Parameters:
  {
    "user_id": 3,
    "option_id": 4
  }
  ```

Will return:

```ruby
  {
    "message": "Movie/season successfully purchased"
  }
```

Or:
```ruby
{
    "errors": [
        "Option already bought"
    ]
}
```

An endpoint to get the library of a user ordered by the remaining time to watch the content:

```ruby
  # get /v1/libraries

  # Parameters:
  {
    "user_id": 1
  }
```

Will return:

```ruby
  {
    "data": [
        {
            "id": "81",
            "type": "library",
            "attributes": {
                "id": 81,
                "alive": true
            },
            "relationships": {
                "user": {
                    "data": {
                        "id": "1",
                        "type": "user"
                    }
                },
                "catalogue": {
                    "data": {
                        "id": "37",
                        "type": "catalogue"
                    }
                }
            }
        } ...
    ],
    "included": [
        {
            "id": "37",
            "type": "catalogue",
            "attributes": {
                "id": 37,
                "category": "season",
                "title": "Blood's a Rover",
                "plot": "Goodnight, my darlings, I'll see you tomorrow."
            },
            "relationships": {
                "episodes": {
                    "data": [
                        {
                            "id": "37",
                            "type": "episode"
                        },
                        {
                            "id": "65",
                            "type": "episode"
                        },
                        {
                            "id": "77",
                            "type": "episode"
                        },
                        {
                            "id": "176",
                            "type": "episode"
                        },
                        {
                            "id": "239",
                            "type": "episode"
                        }
                    ]
                },
                "options": {
                    "data": [
                        {
                            "id": "109",
                            "type": "option"
                        },
                        {
                            "id": "110",
                            "type": "option"
                        },
                        {
                            "id": "111",
                            "type": "option"
                        }
                    ]
                }
            }
        },
        {
            "id": "1",
            "type": "user",
            "attributes": {
                "email": "mail@example.com"
            }
        } ...
    ]
  }
```

