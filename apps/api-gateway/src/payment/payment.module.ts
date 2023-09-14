import { Module } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { PaymentController } from './payment.controller';
import { PaymentService } from './payment.service';
@Module({
  imports: [
    ClientsModule.registerAsync([
      {
        name: 'PAYMENT_MICROSERVICE',
        useFactory: (configService: ConfigService) => ({
          name: 'PAYMENT_MICROSERVICE',
          transport: Transport.KAFKA,
          options: {
            client: {
              clientId: 'payment',
              brokers: configService.get<string>('KAFKA_BROKERS').split(','),
            },
            producerOnlyMode: true,
            consumer: {
              groupId: 'payment-consumer',
            },
          },
        }),
        inject: [ConfigService],
      },
    ]),
  ],
  providers: [PaymentService],
  controllers: [PaymentController],
})
export class PaymentModule {}
