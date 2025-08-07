# EPCOT Web Deployment Guide

## Build for Production

```bash
npm run build
```

This will create a `dist` folder with optimized production files.

## Deployment Options

### 1. GitHub Pages

1. Build the project:
   ```bash
   npm run build
   ```

2. Push the `dist` folder to GitHub Pages or use GitHub Actions

3. Update the base URL in `vite.config.ts` if needed:
   ```typescript
   base: '/your-repo-name/'
   ```

### 2. Netlify

1. Connect your repository to Netlify
2. Set build command: `npm run build`
3. Set publish directory: `dist`

### 3. Vercel

1. Connect your repository to Vercel
2. Vercel will automatically detect Vue.js and build the project

### 4. Static Hosting (AWS S3, etc.)

1. Build the project:
   ```bash
   npm run build
   ```

2. Upload the contents of the `dist` folder to your hosting service

## Environment Variables

The project uses the following environment variables:

- `NODE_ENV`: Set to `production` for production builds
- `BASE_URL`: Base URL for the application (automatically configured)

## URL Configuration

The project automatically handles different deployment scenarios:

- **Development**: Uses root path `/`
- **GitHub Pages**: Uses `/repo-name/` as base URL
- **Custom Domain**: Uses root path `/`
- **Subdirectory Deployment**: Automatically detects and uses correct base URL

Documentation links are dynamically generated based on the current environment.

## Important Notes

1. **Documentation Links**: The docs are served from the `public/docs/` folder
2. **Assets**: All assets (images, videos) are in the `public/` folder
3. **Routing**: Uses Vue Router with hash mode for SPA routing

## Customization

Before deployment, update these files with your actual URLs:

- `src/views/HomeView.vue`: Update GitHub and demo links
- `src/components/Footer.vue`: Update social media links
- `src/components/Navbar.vue`: Update external links

## Troubleshooting

- If assets don't load, check the `base` configuration in `vite.config.ts`
- If routing doesn't work, ensure your hosting service supports SPA routing
- For GitHub Pages, you may need to use hash routing instead of history routing 