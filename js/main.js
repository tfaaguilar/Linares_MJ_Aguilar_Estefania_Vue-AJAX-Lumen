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
            name: "",
            description: "",
            // authorName: "",
            // numberOfPages: "",
            error: false
        }
    },
    methods: {
        getCharacter(wichBook) {
            console.log(wichBook);
            let title = wichBook;
            let convertedTitle = title.split(' ').join('+');
            console.log(convertedTitle);

            fetch(`https://openlibrary.org/search.json?q=${convertedTitle}`)
            .then(res => res.json())
            .then(data => {
                console.log(data.docs[0]);
                //shortcut to the data i want
                const book = data.docs[0];
                if(data.docs.length > 0) {
                    this.error = false;
                    //conditon ? trueExpression : false
                    this.authorName = book.author_name ? book.author_name[0] : 'Not'
                    this.firstSentence = book.first_sentence ? book.first_sentence[0] : 'Not available';
                    this.ratingsAverage = book.ratings_average ? book.ratings_average.toFixed(2) : 'Not available';
                    this.numberOfPages = book.number_of_pages_median ? book.number_of_pages_median : 'Not available';
                }else {
                    this.error = 'No book, try again'
                }
            })
            .catch(error => {
                console.log(error);
                //let user know somethings went wrong in the app
            })
        }
    }
});
disneyland.mount("#app");