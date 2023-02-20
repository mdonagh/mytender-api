endpoint = "http://localhost:3000/graphql"

username = "#{Time.now.to_i.to_s}@record360.com"
password = "Password1234!"

mutation_request = <<~GQL
      mutation SignUp(
        $email: String!,
        $password: String!,
        $firstName: String!,
        $lastName: String!
      ) {
        createUser(input: {
          email: $email,
          password: $password,
          firstName: $firstName,
          lastName: $lastName
        }) {
          user {
            id
            firstName
            lastName
            email
          }
          token
        }
      }
    GQL

response = HTTParty.post(
  endpoint,
  body: {
    query: mutation_request,
    variables: {email: username, password: password, firstName: 'aaaa', lastName: 'bbbb'}
  }
)

ap response
