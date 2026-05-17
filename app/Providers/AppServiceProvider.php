<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Http\Request;
use Illuminate\Cache\RateLimiting\Limit;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // 🛡️ 1. ESCUDO ANTI FUERZA BRUTA PARA EL LOGIN
        RateLimiter::for('login', function (Request $request) {
            // Limita a 5 intentos por minuto basándose en la IP del usuario
            return Limit::perMinute(5)->by($request->ip());
        });

        // 🔒 2. FORZAR RUTAS SEGURAS (HTTPS) EN PRODUCCIÓN (Para Render)
        if (env('APP_ENV') !== 'local') {
            URL::forceScheme('https');
        }
    }
}
