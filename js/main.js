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
        })
    },
    data() {
        return {

        
            charactersData: [],
            characterName: "",
            characterId: null,
            description: "",
            error: false,
            films: "", 
            videoGames: "",
            parkAttractions: "", 
            enemies: "", 
        }
    },

    methods: {
        getCharacter(whichCharacter) {
            console.log(whichCharacter.id);
            let name = whichCharacter.id;
            fetch(`https://api.disneyapi.dev/character/${name}`)
            .then(res => res.json())
                .then(data => {
                    console.log(data);

                    if (data) {
                        this.error = false;
                        this.films = data.data.films.length > 0 ? data.data.films : ['Not'];
                        this.videoGames = data.data.videoGames.length > 0 ? data.data.videoGames : ['Not available'];
                        this.parkAttractions = data.data.parkAttractions.length > 0 ? data.data.parkAttractions : ['Not available'];
                        this.enemies = data.data.enemies.length > 0 ? data.data.enemies : ['Not available'];
                    } else {
                        this.error = 'There is no information for this character. Please try again later.';
                    }
                })
                .catch(error => {
                    console.error(error);
                    this.error = 'Oops! It looks like the data magic did not work this time. Please try again later to uncover more about this enchanting character.';
                });
        }
    }

    
});
disneyland.mount("#app");