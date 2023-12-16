<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('transactionts', function (Blueprint $table) {
            $table->foreignId('typetransactiont_id')->references('id')->on('typetransactionts')->onDelete('cascade');

            //
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('transactionts', function (Blueprint $table) {
            //
        });
    }
};
