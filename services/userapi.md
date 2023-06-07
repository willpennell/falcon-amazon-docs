# User API Design Documentation

## Introduction
The User API will handle basic end user operations (Create, Read, Update, Delete).

An end user will have limited CRUD operations available involving their own account such as being able to reset their password, update their personal details (add/delete addresses, etc), and delete their account (which will trigger a deleted flag in db to be `true` and delete user token and address information).

## Requirements
CRUD API to manage users stored in tbl_users database, an end user will only be able to perform actions on their own account so each action will need to be associated with a valid token attached to their account. 

All input/output data will be in JSON format, example below:

### Input:
```
{
	"forenames": "William",
    "surname": "Penel",
    "emailAddress": "will123@me.com",
    "telephone": "12309912",
    "dateOfBirth": "1993-11-20",
    "password": "will123"
}
```
### Output:
```
{
    "success": true,
    "user_id": 1,
    "message": "User created successfully"
}
```

# User API Endpoints

## Endpoint: api/users
METHOD: <span style="color:orange">POST</span>

## Input:
```
{
	"forenames": "William",
    "surname": "Penel",
    "emailAddress": "will123@me.com",
    "telephone": "12309912",
    "dateOfBirth": "1993-11-20",
    "password": "will123"
}
```
## Output:

 
Status Code: <span style="color:lightgreen">**Sucess, 200 OK**</span>
```
{
    "success": true,
    "response": {
        "userId": 1,
        "forenames": null,
        "surname": null,
        "emailAddress": "will123@me.com",
        "telephone": null,
        "dateOfBirth": null
    },
    "message": null,
    "timestamp": "2023-06-07T09:24:17.6692418"
}
```
Status Code: <span style="color:red">**Error 400 Bad Request**</span>:
```
{
    "success": false,
    "response": null,
    "message": "ERROR: Email Addresses and Phone numbers must be unique.\ncould not execute statement; SQL [n/a]; constraint [null]",
    "timestamp": "2023-06-07T09:27:12.3265063"
}
```
Status Code: <span style="color:red">**Error 409 Conflict**</span>
```
{
    "success": false,
    "response": null,
    "message": "This username already exists",
    "timestamp": "2023-06-07T09:25:29.4433482"
}
```
---
## Endpoint: api/users/{id}
METHOD: <span style="color:lightgreen">GET</span>

## Input: Request param e.g `api/users/1`

## Output: 
Status Code: <span style="color:lightgreen">**Sucess, 200 OK**</span>
```
{
    "success": true,
    "userId": 1,
    "forenames": "will",
    "surname": "penel",
    "email": "will123@me.com",
    "telephone": "012229355",
    "dateOfBirth": "1993-11-20",
}
```
Status Code: <span style="color:red">**Error 404**</span> No user found:
```
{
    "success": false,
    "response": null,
    "message": "User does not exist.",
    "timestamp": "2023-06-07T09:29:11.9200466"
}
```

METHOD: <span style="color:lightblue">PUT</span>

## Input: Request param e.g `api/users/1`
## Input:
```
{
	"forenames": "William",
    "surname": "Davis",
    "emailAddress": "will123@me.com",
    "telephone": "12309912",
    "dateOfBirth": "1993-11-20",
    "password": "will123"
}
```
## Output:
Status Code: <span style="color:lightgreen">**Sucess, 200 OK**</span>
```
{
    "success": true,
    "response": {
        "userId": 1,
        "forenames": null,
        "surname": null,
        "emailAddress": "willDavis@me.com",
        "telephone": null,
        "dateOfBirth": null
    },
    "message": null,
    "timestamp": "2023-06-07T09:30:27.3086162"
}
```
Status Code: <span style="color:red">**Error 404**</span> No user found:
```
{
    "success": false,
    "response": null,
    "message": "User does not exist.",
    "timestamp": "2023-06-07T09:31:06.3270918"
}
```
METHOD: <span style="color:red">DELETE</span> 

## Input: Request param e.g `api/users/1`
## Output:
Status Code: <span style="color:lightgreen">**Sucess, 200 OK**</span>
```
{
    "success": true,
    "response": {
        "userId": 1,
        "forenames": null,
        "surname": null,
        "emailAddress": null,
        "telephone": null,
        "dateOfBirth": null
    },
    "message": null,
    "timestamp": "2023-06-07T09:28:11.126842"
}
```
Status Code: <span style="color:red">**Error 404**</span> No user found:
```
{
    "success": false,
    "response": null,
    "message": "User does not exist.",
    "timestamp": "2023-06-07T09:31:06.3270918"
}
```
