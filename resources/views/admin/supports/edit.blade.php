<h1>Nueva entrada</h1>

<form action="{{ route('supports.store') }}" method="POST">
    {{-- <input type="hidden" value="{{ csrf_token() }}" name="_token"> --}}
    @csrf
    <input type="text" placeholder="Asunto" name="subject">
    <textarea name="body" cols="30" rows="5" placeholder="Descripción"></textarea>
    <button type="submit">Enviar</button>
</form>

{{-- @extends('admin.layouts.app')

@section('title', "Editar a Dúvida {$support->subject}")

@section('header')
<h1 class="text-lg text-black-500">Dúvida {{ $support->subject }}</h1>
@endsection

@section('content')
<form action="{{ route('supports.update', $support->id) }}" method="POST">
    @method('PUT')
    @include('admin.supports.partials.form', [
        'support' => $support
    ])
</form>
@endsection --}}

