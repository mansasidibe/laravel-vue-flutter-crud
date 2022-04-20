<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $product = Product::get();
        return response()->json(['produits' => $product], 200);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validate = $this->validate($request, [
            'product_title' => 'required',
            'product_price' => 'required',
        ]);

        if (Product::create($validate)) {
            return response()->json(['message' => 'cool!'], 200);
        } else{
            return response()->json(['message' => 'non'], 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        return response()->json(['produit' => $product]);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
        $this->validate($request, [
            'product_title' => 'required',
            'product_price' => 'required',
        ]);

        $product = new Product();
        $product->product_title = $request->product_title;
        $product->product_price = $request->product_price;
        if ($product->update()) {
            return response()->json(['message' => 'mis à jour avec succès']);
        } else {
            return response()->json(['message' => 'erreur, désolé']);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $product->delete();
        return response()->json(['message' => 'supprimé avec succès']);
    }
}
