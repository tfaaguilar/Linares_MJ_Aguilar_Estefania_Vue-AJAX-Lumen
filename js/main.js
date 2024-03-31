const disneyland = Vue.createApp({
    created() {
        fetch('http://localhost:8888/disneyland-api/public/characters')
        .then(res => res.json())
        .then(data => {
            console.log(data);
            this.charactersData = data;
        })
        .catch(error => {
            console.log(error);
            //let the user know in app, something is going wrong
        })
    },
    data() {
        return {
            charactersData: [],
            characterName: "",
            description: "",
            // thumbnail: "",
            // numberOfPages: "",
            error: false
        }
    },

    methods: {
        // converted the answer to a string
        getBook(whichBook) {
          console.log(whichBook);
          let title = whichBook;
          // wherever there is a space, replace with a plus
          // take this and place it in the fecth url
          let convertedTitle = title.split(' ').join('+');
          console.log(convertedTitle);
    
          // connecting to second API
          fetch(`https://openlibrary.org/search.json?q=${convertedTitle}`)
          .then(res => res.json())
          .then(data => {
            console.log(data.docs[0]);
            // once we are in the place of the route we need. save it in a variable
            // shortcut to the data I want
            const book = data.docs[0];
            
            // after setting the variables to display
            if(data.docs.length > 0) {
              this.error = false;
              // condition ? trueExpression : falseExpression
              // if it exists then do this, grab the first element of the array if it doesn't : do this
                                  // if this is true ? do this : if not do this 
              this.firstSentence = book.first_sentence ? book.first_sentence[0] : 'Not Available';
              this.ratingsAverage = book.average_rating ? book.average_rating.toFixed(2) : 'Not Available';
              this.authorName = book.author_name ? book.author_name[0] : 'Not Available';
              this.numberofPages = book.number_of_pages_median ? book.number_of_pages_median : 'Not Available';
            } else {
              this.error = "No Book Was Found :( , Please Try Again";
            }
          })
          .catch(error => {
            console.log(error);
          })


    // methods: {
    //     getCharacter(characterName) {
    //         console.log(whichBook);
    //         let name = characterName;
    //         fetch(`https://api.disneyapi.dev/character/?name=${characterName}`)
    //             .then(data => {
    //                 if (data.length > 0) {
    //                     // const character = data[0];
    //                     this.error = false;
    //                     this.films = character.films ? character.films[0] : 'Not';
    //                     this.videoGames = character.videoGames ? character.videoGames[0] : 'Not available';
    //                     this.parkAttractions = character.parkAttractions ? character.parkAttractions[0] : 'Not available';
    //                     this.enemies = character.enemies ? character.enemies : 'Not available';
    //                 } else {
    //                     this.error = 'There is no information for this character. Please try again later.';
    //                 }
    //             })
    //             .catch(error => {
    //                 console.error('There was a problem with the fetch operation:', error);
    //                 this.error = 'There was a problem fetching data. Please try again later.';
    //             });
    //     }
    // }
    
});
disneyland.mount("#app");