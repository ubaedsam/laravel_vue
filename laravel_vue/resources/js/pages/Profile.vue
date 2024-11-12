<template>
    <div>
        <section v-if="id">
            <img v-if="detailuser.photo" :src="'/images/' + detailuser.photo" width="100">
            <h1>Hello User {{ detailuser.name }} - {{ detailuser.email }}</h1>
            <router-link :to="kembali()">Kembali</router-link>
            <a href="#" @click.prevent="handlingDelete">Hapus</a>
            <a href="#" @click.prevent="handlingEdit">Edit</a>
            <router-link :to="{name: 'Upload', params: {id: detailuser.id}}">Upload</router-link>
            <!-- <router-link :to="{name: 'Edit'}">Edit</router-link> -->
        </section>
    </div>
</template>

<script>
export default {
    props: ['id'],
    data() { // Contoh data object pengganti dari ambil database
        return {
            detailuser: {}
        }
    },
    mounted() {
        this.getUser()
    },
    methods: {
        getUser() {
            // Mengambil data dari api menggunakan axios
            axios.get('/api/users/' + this.id).then((response) => {
                console.log(response);

                this.detailuser = response.data
            })
        },
        kembali() {
            return '/user'
        },
        handlingDelete() {
            if (confirm('apakah anda yakin ingin menghapus data ini ?')) {
                axios.delete('/api/users/delete/' + this.id).then((response) => {
                    if (response.data.status) {
                        this.$noty.success(response.data.message)
    
                        this.$router.push({
                            name: 'User'
                        })
                    }
                })
            } else {
                return false
            }
        },
        handlingEdit() {
            this.$router.push({
                name: 'Edit',
                params: { id: this.id }
            })
        }
    }
}
</script>