<template>
  <div class="chart-wrapper">
    <canvas ref="chartRef" width="400" height="400"></canvas>
  </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { Chart, registerables } from 'chart.js'

Chart.register(...registerables)

const props = defineProps<{
  type: 'doughnut' | 'bar'
}>()

const chartRef = ref<HTMLCanvasElement | null>(null)

onMounted(() => {
  if (!chartRef.value) return

  const ctx = chartRef.value.getContext('2d')
  if (!ctx) return

  new Chart(ctx, {
    type: props.type,
    data: props.type === 'doughnut'
      ? {
          labels: ['Transformer-based', 'CNN + Bi-LSTM', 'PyTorch (main)', 'Unified'],
          datasets: [{
            data: [35, 25, 30, 10],
            backgroundColor: ['#ffb400', '#f37021', '#f5476a', '#f971db']
          }]
        }
      : {
          labels: [
            'Variant interpretation',
            'Regulatory element linking',
            'RNA-seq / expression',
            'Histone mark prediction',
            'eQTL classification',
            'Chromatin contact mapping',
            'Enhancer activity',
            'Nascent RNA prediction'
          ],
          datasets: [{
            label: 'Count',
            data: [3, 3, 4, 4, 4, 5, 7, 8],
            backgroundColor: '#6ec6ff'
          }]
        },
    options: {
      responsive: false, // Key point: disable responsive
      maintainAspectRatio: false,
      plugins: {
        title: {
          display: true,
          text: props.type === 'doughnut'
            ? 'Model Groups by Framework'
            : 'Model Groups by Tag',
          font: {
            size: 24
          }
        },
        legend: {
          labels: {
            font: {
              size: 16
            }
          }
        }
      },
      indexAxis: props.type === 'bar' ? 'y' : 'x',
      scales: props.type === 'bar'
        ? {
            x: {
              ticks: { font: { size: 14 } }
            },
            y: {
              ticks: { font: { size: 14 } }
            }
          }
        : {},
      cutout: props.type === 'doughnut' ? '50%' : undefined
    }
  })
})
</script>

<style scoped>
.chart-wrapper {
  width: 250px; /* Control overall chart display width */
  height: 250px;
  margin: auto;
  transform: scale(0.7); /* You can adjust this value, e.g., 0.6 means 60% scale */
  transform-origin: top left; /* Control scale reference point, default is center */
}
</style>
