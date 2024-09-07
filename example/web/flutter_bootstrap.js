{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  config: {
    assetBase: '/flutter_mosaic/',
    renderer: 'canvaskit',
    canvasKitVariant: 'full',
    canvasKitBaseUrl: '/flutter_mosaic/canvaskit/'
  },
  serviceWorkerSettings: {
    serviceWorkerVersion: {{flutter_service_worker_version}},
  },
  onEntrypointLoaded: async function (engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();
    await appRunner.runApp();
  },
});