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
        getCharacter(characterName) {
            console.log(whichBook);
            let name = characterName;
            fetch(`https://api.disneyapi.dev/character/?name=${characterName}`)
                .then(data => {
                    if (data.length > 0) {
                        // const character = data[0];
                        this.error = false;
                        this.films = character.films ? character.films[0] : 'Not';
                        this.videoGames = character.videoGames ? character.videoGames[0] : 'Not available';
                        this.parkAttractions = character.parkAttractions ? character.parkAttractions[0] : 'Not available';
                        this.enemies = character.enemies ? character.enemies : 'Not available';
                    } else {
                        this.error = 'There is no information for this character. Please try again later.';
                    }
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                    this.error = 'There was a problem fetching data. Please try again later.';
                });
        }
    }
    
});
disneyland.mount("#app");