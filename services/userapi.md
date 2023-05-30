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
    "userId": 1,
    "message": "User created successfully"
}
```
Status Code: <span style="color:red">**Error 400 Bad Request**</span>:
```
{
    "success": false,
    "userId": null,
    "message": "Error 400: Failed to create user - exception message"
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
    "userId": null,
    "message": "Error 404: No user found"
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
    "userId": 1,
    "message": "User updated successfully"
}
```
Status Code: <span style="color:red">**Error 404**</span> No user found:
```
{
    "success": false,
    "userId": null,
    "message": "Error 404: Failed to update user - exception message"
}
```
METHOD: <span style="color:red">DELETE</span> 

## Input: Request param e.g `api/users/1`
## Output:
Status Code: <span style="color:lightgreen">**Sucess, 200 OK**</span>
```
{
    "success": true,
    "userId": 1,
    "message": "User deleted successfully"
}
```
Status Code: <span style="color:red">**Error 404**</span> No user found:
```
{
    "success": false,
    "userId": null,
    "message": "Error 404: Failed to delete user - exception message"
}
```
