import Fastify from 'fastify';
import cors from '@fastify/cors';
import { appRoutes } from './routes';

const app = Fastify();

app.register(cors, {
  origin: '*',
});
app.register(appRoutes);

app.listen({ port: 3366, host: '0.0.0.0' }).then((value) => {
  console.log('HTTP server runnning!');
});
