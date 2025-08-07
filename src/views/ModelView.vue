<template>
  <div class="model-table">
    <el-table
      :data="models"
      style="width: 100%"
      border
      stripe
    >
      <el-table-column label="Model name">
        <template #default="scope">
          <el-link
            type="primary"
            @click="goToModel(scope.row.id)"
          >
            {{ scope.row.name }}
          </el-link>
        </template>
      </el-table-column>

      <el-table-column prop="version" label="Version" sortable />
      <el-table-column prop="authors" label="Authors" />
      <el-table-column prop="contributed" label="Contributed by" />
    </el-table>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

interface Model {
  id: string
  name: string
  version: string
  authors: string
  contributed: string
}

const models = ref<Model[]>([
  {
    id: 'epcot-v1',
    name: 'EPCOT',
    version: '1.0',
    authors: 'Zhenhao Zhang et al.',
    contributed: 'U. Michigan'
  },
  {
    id: 'epcot-v2',
    name: 'EPCOTv2',
    version: '2.0',
    authors: 'Zhenhao Zhang, Xinyu Bao',
    contributed: 'Broad Institute'
  }
])

const goToModel = (id: string) => {
  router.push(`/model/${id}`)
}
</script>

<style scoped>
.model-table {
  padding: 2rem;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}
</style>
