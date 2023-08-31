import { Module } from '@nestjs/common';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersRepository } from './users.repository';

@Module({
  controllers: [AppController],
  providers: [AppService, UsersRepository],
})
export class AppModule {}
