<template>
    <div>
        <section>
            <h1>Daftar User</h1>
            <router-link to="/user/create">Register</router-link>
            <ul>
                <li v-for="user in users">
                    <!-- <router-link :to="profile_url(user.username)">{{ user.username }}</router-link> -->
                    <a href="#" @click.prevent="lihatUser(user.id)">{{ user.name }}</a>
                </li>
            </ul>
        </section>
    </div>
</template>

<script>
    export default {
        data() { // Contoh data object pengganti dari ambil database
            return {
                users: [],
            }
        },
        watch: {
            '$route': 'getUsers'
        },
        mounted() {
            this.getUsers()
        },
        methods: {
            getUsers() {
                // Mengambil data dari api menggunakan axios
                axios.get('/api/users').then((response) => {
                    console.log(response);
                    this.users = response.data
                })
            },
            profile_url(id) {
                return '/user/' + id.toLowerCase()
            },
            lihatUser(id){
                // this.$router.push('/user/' + name.toLowerCase())
                this.$router.push({
                    name: 'Profile',
                    // params: { id: id.toLowerCase() }
                    params: { id }
                })
            }
        }
    }
</script>