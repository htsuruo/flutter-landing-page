'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "3d866fc80be96b5b45aa69d870386299",
"index.html": "cff776b971594a20423f27d0e3922972",
"/": "cff776b971594a20423f27d0e3922972",
"main.dart.js": "59032946e5b6e5ab7f4aa92d0899730b",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"style.css": "01927a000417fc07ef0612ba431f527f",
"manifest.json": "afcb70c810299f4bfaec5bdef0f51395",
"assets/AssetManifest.json": "78338cb40720e235e11ea7c70241efe6",
"assets/NOTICES": "fef30b409d2e6373e854e9d9dfb4f726",
"assets/FontManifest.json": "1354a84f16fb1a115db6d37ac01e09cd",
"assets/AssetManifest.bin.json": "a3c84d96120404a1f5349292a9d1d4b8",
"assets/packages/lucide_icons_flutter/assets/lucide.ttf": "47b4fdec4eb19353fd9d053c55da20f3",
"assets/packages/shadcn_ui/fonts/Geist-UltraLight.otf": "b64b37fbec0a925067cbf530e4962fec",
"assets/packages/shadcn_ui/fonts/Geist-Thin.otf": "8603d0fe0def4273ebeee670eedcfb86",
"assets/packages/shadcn_ui/fonts/Geist-Bold.otf": "d3e1d3dc690224fd330969af598a9c31",
"assets/packages/shadcn_ui/fonts/Geist-Black.otf": "cf003c4f85b590cf60bec1e111ebaaf5",
"assets/packages/shadcn_ui/fonts/Geist-Regular.otf": "4d02716b4f2f2e4d9c568c8d24e8e74d",
"assets/packages/shadcn_ui/fonts/Geist-Light.otf": "21f434e8c2b53240a0c459b9d119f22f",
"assets/packages/shadcn_ui/fonts/Geist-SemiBold.otf": "2c0b1d3e7b1c71bedc2eecf78f7a1d1d",
"assets/packages/shadcn_ui/fonts/Geist-Medium.otf": "f7ceaf00b58d396cf93ff1ea43740027",
"assets/packages/shadcn_ui/fonts/Geist-UltraBlack.otf": "f3591a030925294b2bb427e6a6c9b0d8",
"assets/packages/shadcn_ui/assets/chevron-down.svg": "401cb93b87962ef28fc973f14c62cedf",
"assets/packages/shadcn_ui/assets/terminal.svg": "d89364f32ac61fdadb12eec52f20fbed",
"assets/packages/shadcn_ui/assets/chevron-up.svg": "5d3f9fdbc9711281e44732a588f2ce6f",
"assets/packages/shadcn_ui/assets/x.svg": "613f6e881105344acc26e2239645c446",
"assets/packages/shadcn_ui/assets/check.svg": "d195799491cf4ed29d8bde4852731bd6",
"assets/packages/shadcn_ui/assets/alert-circle.svg": "1443692a964f7b5898f5c4ad1f162479",
"assets/packages/shadcn_ui/assets/bell-ring.svg": "85a9c6dff39a47295bf48fef58a3bf58",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "af905e38b668f70372bce431b24cfd7d",
"assets/fonts/MaterialIcons-Regular.otf": "5e39fccf0875018be1d4c2cebf969336",
"assets/assets/sns_x_mark.svg": "0c9462a79f736453eac5bf7cbb756875",
"assets/assets/sns_github_mark.svg": "8dcc6b5262f3b6138b1566b357ba89a9",
"assets/assets/sns_discord_mark.svg": "0787ad5cd372888305f0930ebab09818",
"assets/assets/logo_light.svg": "4b901cfa152f07fa1a1a517f91465e2d",
"assets/assets/logo_dark.svg": "adb43fca08cca4973533014084b9dece",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
