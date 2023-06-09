fetch('../LoginServlet')
    .then(response => response.text())
    .then(data  => console.log(data));
