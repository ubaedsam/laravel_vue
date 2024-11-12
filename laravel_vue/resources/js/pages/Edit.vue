<template>
    <div>
        <h1>Edit User</h1>
        <form @submit.prevent="handleUpdate">
            <div class="input-group">
                <label for="name">Name</label>
                <input type="text" v-model="user.name">
                <br>
                <div class="error" v-if="errors.name">
                    {{ errors.name[0] }}
                </div>
            </div>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="text" v-model="user.email">
                <br>
                <div class="error" v-if="errors.email">
                    {{ errors.email[0] }}
                </div>
            </div>

            <button type="submit">Update</button>
        </form>
    </div>
</template>

<script>
export default {
    props: ['id'],
    data() {
        return {
            user: {
                name: '',
                email: ''
            },
            errors: {},
        }
    },
    methods: {
        handleUpdate() {
            axios.put('/api/users/update/' + this.id, this.user).then((response) => {
                if (response.data.status) {
                    this.$noty.success(response.data.message)

                    this.$router.push({
                        name: 'User'
                    })
                }
            }).catch((error) => {
                if (error.response.status == 403) {
                    this.errors = error.response.data.message
                }
            })
        },
        getUser() {
            // Mengambil data dari api menggunakan axios
            axios.get('/api/users/' + this.id).then((response) => {
                this.user = {
                    name: response.data.name,
                    email: response.data.email
                }
            })
        },
    },
    created() {
        this.getUser()
    }
}
</script>

<style>
.input-group {
    margin-bottom: 5px;
}
</style>