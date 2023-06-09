function displayMovies(movies) {
    var movieContainer = document.getElementById('movieContainer');

    for (var i = 0; i < movies.length; i++) {
        var movieDiv = document.createElement('div');

        // Create elements for each attribute
        var titleElement = document.createElement('h2');
        var directorElement = document.createElement('p');
        var writerElement = document.createElement('p');
        var actorsElement = document.createElement('p');
        var releaseDateElement = document.createElement('p');
        var genresElement = document.createElement('p');
        var ratingElement = document.createElement('p');
        var descriptionElement = document.createElement('p');
        var imageElement = document.createElement('img');

        // Set the text/content for each element
        titleElement.textContent = movies[i].name;
        directorElement.textContent = "Director: " + movies[i].director;
        writerElement.textContent = "Writer: " + movies[i].writer;
        actorsElement.textContent = "Actors: " + movies[i].actors;
        releaseDateElement.textContent = "Release Date: " + movies[i].releaseDate;
        genresElement.textContent = "Genres: " + movies[i].genres;
        ratingElement.textContent = "Rating: " + movies[i].rating;
        descriptionElement.textContent = "Description: " + movies[i].description;

        // Set the source for the image element
        imageElement.src = movies[i].imageUrl;
        imageElement.setAttribute("referrerpolicy", "no-referrer");

        // Add event listeners for mouseover and click events
        (function(imageElem) {
            imageElem.addEventListener("mouseover", function() {
                // Apply CSS styles for image zoom and border highlight
                this.style.transform = "scale(1.2)";
                this.style.border = "2px solid yellow";
            });

            imageElem.addEventListener("mouseout", function() {
                // Remove CSS styles for image zoom and border highlight
                this.style.transform = "scale(1)";
                this.style.border = "none";
            });

            imageElem.addEventListener("click", function() {
                var movieName = movies[i].name;
                var clickTime = new Date().toISOString();
                // Call a function to store movieName and clickTime in the survey table
                recordMovieClick(movieName, clickTime);
            });
        })(imageElement);


        // // Add event listeners for mouseover and click events
        // imageElement.addEventListener("mouseover", function() {
        //     // Apply CSS styles for image zoom and border highlight
        //     this.style.transform = "scale(1.2)";
        //     this.style.border = "2px solid yellow";
        // });
        //
        // imageElement.addEventListener("mouseout", function() {
        //     // Remove CSS styles for image zoom and border highlight
        //     this.style.transform = "scale(1)";
        //     this.style.border = "none";
        // });

        // Append each element to the movieDiv
        movieDiv.appendChild(titleElement);
        movieDiv.appendChild(directorElement);
        movieDiv.appendChild(writerElement);
        movieDiv.appendChild(actorsElement);
        movieDiv.appendChild(releaseDateElement);
        movieDiv.appendChild(genresElement);
        movieDiv.appendChild(ratingElement);
        movieDiv.appendChild(descriptionElement);
        movieDiv.appendChild(imageElement);

        // Append the movieDiv to the movieContainer
        movieContainer.appendChild(movieDiv);

        // // Set the source for the image element
        // imageElement.src = movies[i].imageUrl;
        // imageElement.setAttribute("referrerpolicy", "no-referrer");



        // imageElement.addEventListener("click", function() {
        //     var movieName = movies[i].name;
        //     var clickTime = new Date().toISOString();
        //     // Call a function to store movieName and clickTime in the survey table
        //     recordMovieClick(movieName, clickTime);
        // });

    }
}

