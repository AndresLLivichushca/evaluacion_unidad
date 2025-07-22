# Proyecto Microservicio Universidades - Evaluación

Este proyecto corresponde a la evaluación de la unidad de Arquitectura Distribuida. Se desarrolla un microservicio en Java (Spring Boot o Jakarta EE) que se conecta a una base de datos PostgreSQL. El sistema está dockerizado y puede desplegarse tanto con Docker Compose como en un clúster local de Kubernetes (Minikube).

---

## Repositorio

Repositorio del proyecto:  
[https://github.com/AndresLLivichushca/evaluacion_unidad](https://github.com/AndresLLivichushca/evaluacion_unidad)

---

## Contenido

- `Dockerfile`: construye la imagen del microservicio Java.
- `docker-compose.yml`: levanta microservicio + base de datos en red local.
- `k8s/`: manifiestos YAML para desplegar en Kubernetes:
  - `database-deployment.yaml`
  - `database-service.yaml`
  - `microservice-deployment.yaml`
  - `microservice-service.yaml`

---

## Docker Compose (Modo Local)

### 1. Clonar el repositorio

```bash
git clone https://github.com/AndresLLivichushca/evaluacion_unidad.git
cd evaluacion_unidad
```

### 2. Levantar con Docker Compose

```bash
docker-compose up --build
```

> Esto construirá la imagen del microservicio y levantará también la base de datos PostgreSQL. La aplicación quedará disponible en:  
> `http://localhost:8082/api/universidades`

---

## Despliegue en Kubernetes (Minikube)

### 1. Iniciar Minikube

```bash
minikube start
```

### 2. Aplicar los manifiestos de Kubernetes

```bash
kubectl apply -f k8s/
```

Esto levantará:
- La base de datos PostgreSQL
- El microservicio con 3 réplicas
- Servicios tipo `ClusterIP` y `LoadBalancer` para exponer los pods

### 3. Verificar los pods

```bash
kubectl get pods
```

### 4. Acceder al servicio

```bash
minikube service microservice-service
```

Se abrirá una pestaña con una URL tipo:

```
http://127.0.0.1:PORT/api/universidades
```

Si accede a `/` directamente, puede aparecer error 404 blanco de Spring (normal).

---

## Subir imagen a Docker Hub

1. **Iniciar sesión:**

```bash
docker login
```

Usuario: `andreslli07`  
(contraseña debe ingresarse manualmente)

2. **Construir la imagen:**

```bash
docker build -t andreslli07/universidades-app .
```

3. **Subir al repositorio:**

```bash
docker push andreslli07/universidades-app
```

> Asegúrate de tener acceso a internet y haber iniciado sesión correctamente.

---

## Credenciales de Base de Datos

| Base de datos  | `evaluacion_unidad` |
| Usuario        | `postgres`    |
| Contraseña     | `JOSE123456`  |
| Puerto         | `5432`        |

---

## Pruebas de API

```
GET http://localhost:8082/api/universidades
```


