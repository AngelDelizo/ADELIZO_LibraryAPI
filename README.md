# Library API

The **Library API** is a RESTful library system management service. It includes functionalities for managing users, authors, books, and the relationships between books and authors. This API uses JSON Web Tokens (JWT) for secure authentication and supports complete CRUD operations.

## Table of Contents
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Authentication](#authentication)
  - [Overview](#overview)
  - [Token Management](#token-management)
  - [Authentication Flow](#authentication-flow)
- [Endoints](#crud-operations)
- [CRUD Operations](#crud-operations)

## Features
- **RESTful Architecture**: Supports standard HTTP methods (GET, POST, PUT, DELETE).
- **JWT Authentication**: Secure access to the API with JSON Web Tokens.
- **Token Revocation**: Ensures tokens are valid for only one use, enhancing security.
- **CRUD Operations**: Manage users, authors, book, and book-author relationships.
- **Token Lifecycle Management**: Prevent token reuse for enhanced security.

## Technologies Used

- **PHP**: Backend language.
- **Slim Framework**: For building the API structure.
- **Firebase JWT Library**: For token generation and validation.
- **Composer**: Dependency management.
- **MySQL**:
  - Relational database to store user, author, book, and relationship data.
  - Structured with normalized tables for efficient queries.
  - Ensures data integrity with primary/foreign keys and constraints.

---

## Authentication

### Overview

The API uses JWT for authenticating requests. Upon login, users receive a token that must be included in the `Authorization` header of subsequent requests.

### Token Management

- Each token is unique and stored temporarily.
- Tokens are validated and checked for reuse.
- Expired or reused tokens will result in an authentication failure.
  
### Authentication Flow

1. User logs in with valid credentials.
2. API returns a JWT.
3. The user includes the token in the `Authorization` header (`Bearer <token>`) for subsequent requests.
4. API validates the token before processing requests.
   
---
## Endpoints (Total: 17)

| **Endpoint**          | **Method** | **Description**                          |
|-----------------------|------------|------------------------------------------|
| `/user/login`         | `POST`     | Authenticate user and return JWT.        |
| `/users/register`     | `POST`     | Register a new user.                     |
| `/users/read`         | `GET`      | Retrieve all registered users.           |
| `/user/update`        | `PUT`      | Update user details.                     |
| `/users/delete`       | `DELETE`   | Delete a user.                           |
| `/author/add`         | `POST`     | Add a new author.                        |
| `/authors/read`       | `GET`      | Retrieve all authors.                    |
| `/author/update`      | `PUT`      | Update author details.                   |
| `/author/delete`      | `DELETE`   | Delete an author.                        |
| `/book/add`           | `POST`     | Add a new book.                          |
| `/books/read`         | `GET`      | Retrieve all books.                      |
| `/book/update`        | `PUT`      | Update book details.                     |
| `/book/delete`        | `DELETE`   | Delete a book.                           |
| `/book_author/add`    | `POST`     | Associate a book with an author.         |
| `/book_authors/read`  | `GET`      | Retrieve all book-author relationships.  |
| `/book_author/update` | `PUT`      | Update book-author relationship.         |
| `/book_authors/delete`| `DELETE`   | Delete a book-author relationship.       |

  
#  CRUD OPERATIONS
## 1. USER
### 1.1 User Authentication or Login
- **Endpoint:** `/user/authenticate`  

- **Method:** `POST`  

- **Description:** 
    Validate user credentials by checking the provided username and password in the database. If authentication is successful, a JSON Web Token (JWT) is generated and returned for secure session handling.

- **Sample Request (JSON):**
    ```json
    {
        "username": "newuser",
        "password": "password123"
    }
    ```

- **Response:**
    - **Success:**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": null
        }
        ```

    - **Failure (Authentication Failed):**
        ```json
        {
            "status": "fail",
            "data": "Authentication Failed!"
        }
        ```
---
### 1.2 Create/Add/Register a new user
- **Endpoint:** `/user/register`
   
- **Method:** `POST`
  
- **Description:**  
  Creates a new user account by accepting a unique username and password. Ensures both inputs are at least 3 characters long.

- **Sample Request (JSON):**
    ```json
    {
        "username": "newuser",
        "password": "password123"
    }
    ```

- **Response:**
    - **Success:**
        ```json
        {
            "status": "success",
            "data": null
        }
        ```

    - **Failure (Invalid Input):**
        ```json
        {
            "status": "fail",
            "data": "Username and password must be at least 3 characters long and not empty"
        }
        ```

    - **Failure (Duplicate Username):**
        ```json
        {
            "status": "fail",
            "data": "Username already exists"
        }
        ```
---
### 1.3 View/Get all user
- **Endpoint:** `/users/read`  
- **Method:** `GET`  
- **Description:**  
Retrieves a list of all users with their IDs and usernames.

- **Sample Request:**
    - No request body is required. Authentication is handled via the Authorization header.

- **Response:**
    - **Success:**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": [
                {
                    "userid": 1,
                    "username": "angelmay"
                },
                {
                    "userid": 2,
                    "username": "angeldelizo"
                }
            ]
        }
        ```
    - **Failure (Unauthorized):**
        ```json
        {
            "status": "fail",
            "data": "Unauthorized: Token not provided"
        }
        ```

    - **Failure (No Users Found):**
        ```json
        {
            "status": "fail",
            "data": "No users found"
        }
        ```
---
### 1.4 Update user info (name and password)
- **Endpoint:** `/user/update`  
- **Method:** `PUT`  
- **Description:**  
  Allows an authenticated user to update their username and password. 

- **Request Body (JSON):**
    ```json
    {
        "userid": "1",
        "username": "angelmay(updated)",
        "password": "newpass"
    }
    ```

- **Response:**
    - **Success:**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": "User updated successfully"
        }
        ```

    - **Failure (User Not Found):**
        ```json
        {
            "status": "fail",
            "data": "User with ID 1 does not exist."
        }
        ```

    - **Failure (Validation Error):**
        ```json
        {
            "status": "fail",
            "data": "Username and password must be at least 3 characters long and not empty"
        }
        ```
---
### 1.5 Delete a user
- **Endpoint:** `/user/delete`  
- **Method:** `DELETE`  
- **Description:**  
  Deletes a specific user based on their ID.

- **Request Body (JSON):**
    ```json
    {
        "userid": "1"
    }
    ```

- **Response:**
    - **Success:**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": "User deleted successfully"
        }
        ```

    - **Failure (User Does Not Exist):**
        ```json
        {
            "status": "fail",
            "data": "User with ID 1 does not exist."
        }
        ```

    - **Failure (Validation Error):**
        ```json
        {
            "status": "fail",
            "data": "User ID must be provided."
        }
        ```
---

## 2. AUTHOR
### 2.1 Create/Add a new author
- **Endpoint:** `/authors/create`  
- **Method:** `POST`  
- **Description:**  
  Adds a new author to the database. The author’s name must be unique, at least five characters long, and cannot be blank.

- **Request Body (JSON):**
    ```json
    {
        "name": "Jonaxx"
    }
    ```

- **Response:**
    - **Success:**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": "Author created successfully"
        }
        ```

    - **Failure (Validation Error):**
        ```json
        {
            "status": "fail",
            "data": "Author name must be more than 5 characters and cannot be blank."
        }
        ```
---
### 2.2 Update author information
- **Endpoint:** `/author/update`  
- **Method:** `PUT`  
- **Description:**  
  This API endpoint allows updating the information of an existing author. The request payload must include the `authorid` (the ID of the author to be updated) and the new `name` of the author. The name must be at least 5 characters long. The operation is protected by a JWT token, which will be rotated and returned upon a successful request.

- **Request Body (JSON):**
    ```json
    {
        "authorid": "1",
        "name": "Jonaxx(updated)"
    }
    ```

- **Response:**
    - **Success:**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": "Author updated successfully"
        }
        ```

    - **Failure (Validation Error):**
        ```json
        {
            "status": "fail",
            "data": "Author name must be more than 5 characters and cannot be blank."
        }
        ```

    - **Failure (Author Not Found):**
        ```json
        {
            "status": "fail",
            "data": "Author with ID 1 does not exist."
        }
        ```
---
### 2.3 View/Get all authors
- **Endpoint:** `/authors/read`  
- **Method:** `GET`  
- **Description:**  
  Retrieves a list of all the authors unique IDs and names.

- **Sample Request:**
    - No request body is required. Authentication is handled via the Authorization header.

- **Response:**
    - **Success:**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": [
                {
                    "authorid": 1,
                    "name": "Jonaxx"
                },
                {
                    "authorid": 2,
                    "name": "Maxinejiji"
                },
                ...
            ]
        }
        ```

    - **Failure (No Authors Found):**
        ```json
        {
            "status": "fail",
            "data": "No authors found"
        }
        ```
---
### 2.4 Delete an author
- **Endpoint:** `/author/delete`  
- **Method:** `DELETE`  
- **Description:**  
  Deletes an existing author based on their unique ID.

- **Request Body (JSON):**
    ```json
    {
      "authorid": 1
    }
    ```

- **Response:**
    - **Success:**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": "Author deleted successfully"
        }
        ```

    - **Failure (Validation Error):**
        ```json
        {
            "status": "fail",
            "data": "Author ID must be provided."
        }
        ```

    - **Failure (Author Not Found):**
        ```json
        {
            "status": "fail",
            "data": "Author with ID 1 does not exist."
        }
        ```
---

## 3. BOOK
### 3.1 Create a new book
- **Endpoint:** `/book/add`  
- **Method:** `POST`  
- **Description:**  
  Creates a new book which requires the title of the book and the authorid (the ID of the author) to associate the book with.

- **Request Body (JSON):**
    ```json
    {
        "title": "Heartless",
        "authorid": 1
    }
    ```

- **Response:**
    - **Success:**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": "Book created successfully"
        }
        ```

    - **Failure (Book Title Invalid):**
        ```json
        {
            "status": "fail",
            "data": "Book title must be more than 5 characters and cannot be blank."
        }
        ```

    - **Failure (Author Not Found):**
        ```json
        {
            "status": "fail",
            "data": "Author not found"
        }
        ```
---
### 3.2 View/Get all books
- **Endpoint:** `/books/read`  
- **Method:** `GET`  
- **Description:**  
  Retrieves a list of all books stored in the database including their book ID, title, author ID, and author name.

- **Sample Request:**
    - No request body is required. Authentication is handled via the Authorization header.

- **Response:**
    - **Success (Books Retrieved):**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": [
                {
                    "bookid": 1,
                    "title": "Heartless",
                    "authorid": 1,
                    "author_name": "Jonaxx"
                },
                {
                    "bookid": 2,
                    "title": "He's into Her",
                    "authorid": 2,
                    "author_name": "Maxinejiji"
                },
                ...
            ]
        }
        ```

    - **Failure (No Books Found):**
        ```json
        {
            "status": "fail",
            "data": "No books found"
        }
        ```
---

### 3.3 Update book information
- **Endpoint:** `/book/update`  
- **Method:** `PUT`  
- **Description:**  
  Updates the information of an existing book. The request must include the bookid (the ID of the book to be updated), the new title of the book, the authorid, and must be at least 5 characters long.

- **Request Body (JSON):**
    ```json
    {
        "bookid": 1,
        "title": "Heartless(Updated)",
        "authorid": 1
    }
    ```

- **Response:**
    - **Success (Book Updated):**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": "Book updated successfully"
        }
        ```

    - **Failure (Book Not Found):**
        ```json
        {
            "status": "fail",
            "data": "Book with ID 1 does not exist."
        }
        ```

    - **Failure (Validation Error):**
        ```json
        {
            "status": "fail",
            "data": "Book title must be more than 5 characters and cannot be blank."
        }
        ```
---

### 3.4 Delete a book
- **Endpoint:** `/book/delete`  
- **Method:** `DELETE`  
- **Description:**  
  Deletes an existing book from the database based on their unique ID.

- **Request Body (JSON):**
    ```json
    {
        "bookid": 2
    }
    ```

- **Response:**
    - **Success (Book Deleted):**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": "Book deleted successfully"
        }
        ```

    - **Failure (Validation Error):**
        ```json
        {
            "status": "fail",
            "data": "Book ID must be provided."
        }
        ```
        
    - **Failure (Book Does Not Exist):**
        ```json
        {
            "status": "fail",
            "data": "Book with ID 2 does not exist."
        }
        ```
---



## 4. BOOK & AUTHOR RELATIONSHIP
### 4.1 Create a new book-author relationship
- **Endpoint:** `/book_author/add`  
- **Method:** `POST`  
- **Description:**  
  This API endpoint creates a new book-author relationship by linking a specific book and author based on bookid and authorid.

- **Request Body (JSON):**
    ```json
    {
        "bookid": "1",
        "authorid": "1"
    }
    ```

- **Response:**
    - **Success (Book-Author Relationship Created):**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": "Book-author relationship created successfully"
        }
        ```

    - **Failure (Book Does Not Exist):**
        ```json
        {
            "status": "fail",
            "data": "Book does not exist"
        }
        ```

    - **Failure (Author Does Not Exist):**
        ```json
        {
            "status": "fail",
            "data": "Author does not exist"
        }
        ```

    - **Failure (Foreign Key Constraint Violation):**
        ```json
        {
            "status": "fail",
            "data": {
                "title": "Foreign key constraint violation",
                "details": "Error message from the database"
            }
        }
        ```
---
### 4.2. Get/View all book-author relationships
- **Endpoint:** `/book_authors/read`  
- **Method:** `GET`  
- **Description:**  
  This endpoint retrieves all book-author relationships stored in the database with the information of the books and authors involved in each relationship.
  
- **Sample Request:**
    - No request body is required. Authentication is handled via the Authorization header.

- **Response:**
    - **Success (Book-Author Relationships Found):**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": [
                {
                    "collectionid": "1",
                    "bookid": "1",
                    "authorid": "1",
                    "book_title": "Book Title",
                    "author_name": "Author Name"
                },
                {
                    "collectionid": "2",
                    "bookid": "2",
                    "authorid": "2",
                    "book_title": "Book Title",
                    "author_name": "Author Name"
                }
            ]
        }
        ```

    - **Failure (No Book-Author Relationships Found):**
        ```json
        {
            "status": "fail",
            "data": "No book-author relationships found"
        }
        ```
---
### 4.3 Update book-author relationship
- **Endpoint:** `/book_author/update`  
- **Method:** `PUT`  
- **Description:**  
  This endpoint allows updating an existing book-author relationship by specifying the collectionid, bookid, and authorid.

- **Request Body (JSON):**
    ```json
    {
        "collectionid": "3",
        "bookid": "3",
        "authorid": "3"
    }
    ```

- **Response:**
    - **Success (Book-Author Relationship Updated):**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": "Book-author relationship updated successfully"
        }
        ```

    - **Failure (Book Does Not Exist):**
        ```json
        {
            "status": "fail",
            "data": "Book does not exist"
        }
        ```

    - **Failure (Author Not Found):**
        ```json
        {
            "status": "fail",
            "data": "Author does not exist"
        }
        ```

    - **Failure (Foreign Key Constraint Violation):**
        ```json
        {
            "status": "fail",
            "data": {
                "title": "Foreign key constraint violation",
                "details": "<Error_Message>"
            }
        }
        ```
---
### 4.4 Delete a book-author relationship
- **Endpoint:** `/book_authors/delete`  
- **Method:** `DELETE`  
- **Description:**  
  This endpoint deletes an existing book-author relationship identified by the collectionid.

- **Request Body (JSON):**
    ```json
    {
        "collectionid": "1"
    }
    ```

- **Response:**
    - **Success (Book-Author Relationship Deleted):**
        ```json
        {
            "status": "success",
            "token": "<access_token>",
            "data": "Book-author relationship deleted successfully"
        }
        ```

    - **Failure (Database Error):**
        ```json
        {
            "status": "fail",
            "data": {
                "title": "<Error_Message>"
            }
        }
        ```
---
