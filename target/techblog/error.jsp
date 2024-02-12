<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>sorry something went wrong</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />

    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    <div class="container text-center">
      <img src="images/server.png" class="img-fluid" />
      <h1 class="display-3">sorry something went wrong</h1>

      <p><%= exception %></p>
      <a
        href="index.jsp"
        class="btn btn-outline-primary text-white primary-background p-1 btn-lg"
        >HOME</a
      >
    </div>
  </body>
</html>
