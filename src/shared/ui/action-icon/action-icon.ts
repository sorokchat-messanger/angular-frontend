import { ICON_SIZE } from '../../constants';
import { Component, input } from '@angular/core';
import { type LucideIcon } from '@lucide/angular';
import { Icon } from '../icon';

@Component({
  selector: 'app-action-icon',
  imports: [Icon],
  templateUrl: './action-icon.html',
  styleUrl: './action-icon.scss',
})
export class ActionIcon {
  public readonly icon = input.required<LucideIcon>();
  public readonly size = input<number>(ICON_SIZE);
}
