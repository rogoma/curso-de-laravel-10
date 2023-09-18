<h1>Listado de Soportes</h1>

{{-- <a href="{{route('supports.create') }}">Nueva tarea</a>

<table>
    <thead>
        <th>Asunto</th>
        <th>Estado</th>
        <th>Descripción</th>
        <th></th>
    </thead>
    <tbody>
        @foreach ($supports as $support)
            <tr>
                <td>{{$support->subject}}</td>
                <td>{{$support->status}}</td>
                <td>{{$support->body}}</td>
                <td>
                    <a href="{{ route('supports.show', $support->id) }}">ir</a>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>

@extends('admin.layouts.app')

@section('title', 'Fórum')

@section('header')
@include('admin.supports.partials.header', compact('supports'))
@endsection

@section('content')
@include('admin.supports.partials.content')

<x-pagination
    :paginator="$supports"
    :appends="$filters" />
@endsection --}}
