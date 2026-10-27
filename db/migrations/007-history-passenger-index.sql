-- Индекс истории пассажира. История поездок читается по одному пассажиру от свежих к старым. Условие
-- равенства passenger_id первым полем обслуживает фильтр WHERE, created_at
-- DESC вторым повторяет ORDER BY, поэтому LIMIT останавливает чтение на
-- первых записях индекса, а не сканирует всю таблицу. Решение и сравнение
-- вариантов — design/adr/010-history-index.md.
CREATE INDEX IF NOT EXISTS trips_passenger_created ON trips (passenger_id, created_at DESC);
