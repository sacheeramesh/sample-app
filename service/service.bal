import ballerina/http;

service / on new http:Listener(909) {

    resource function get user\-info(http:RequestContext ctx)
        returns json|http:BadRequest|http:InternalServerError {

        // return loggedInUser;
        return {
            "employeeId": "LK01",
            "workEmail": "user@wso2.com",
            "firstName": "Jon",
            "lastName": "Smith",
            "jobRole": "Software Engineer",
            "employeeThumbnail": "https://lh3.googleusercontent.com/a-/AD_cMMSnMZHGu0KUrodL-VE_9HBAOoQXN3mw7XwDaQFZuj_iAKc=s100"
        };

    }

    isolated resource function get collections(http:RequestContext ctx, string? name, int? 'limit, int? offset)
        returns json|http:Forbidden|http:BadRequest|http:InternalServerError {

        return {
            "count": 2,
            "collections": [
                {
                    "id": 1,
                    "name": "Collection 1",
                    "createdOn": "2024-07-03 10:19:09.236415",
                    "createdBy": "user@wso2.com",
                    "updatedOn": "2024-07-11 06:10:24.148038",
                    "updatedBy": "user@wso2.com"
                },
                {
                    "id": 2,
                    "name": "Collection 2",
                    "createdOn": "2024-07-03 10:19:09.238862",
                    "createdBy": "user@wso2.com",
                    "updatedOn": "2024-07-03 10:19:09.238862",
                    "updatedBy": "user@wso2.com"
                }
            ]
        };
    }

    resource function post collections(http:RequestContext ctx)
        returns http:Created|http:Forbidden|http:BadRequest|http:InternalServerError {

        return <http:Created>{
            body: {
                "id": 7,
                "name": "test 1",
                "createdOn": "2024-07-11 06:47:01.185837",
                "createdBy": "sachinr@wso2.com",
                "updatedOn": "2024-07-11 06:47:01.185837",
                "updatedBy": "sachinr@wso2.com"
            }
        };
    }
}
